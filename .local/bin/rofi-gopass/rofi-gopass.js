#!/usr/bin/env node
const {
  assign,
  Async,
  ifElse,
  maybeToAsync,
  prop,
} = require('crocks');

const {exec, spawn} = require('child_process');
const {promisify} = require('util');
const {EOL} = require('os');

// execAsync :: String -> Async e String
const execAsync = Async.fromPromise(promisify(exec));

// log :: String -> a -> a
const log = label => x =>
  (console.log(`${label}:`, x), x);

// propAsync :: String -> Object -> Async e a
const propAsync = propName => maybeToAsync(`No ${propName}`, prop(propName));

// getStdout :: Object -> Async e a
const getStdout = propAsync('stdout');

// parseGopassOutput :: String -> Object
const parseGopassOutput = out => `password: ${out}`.split(EOL)
      .map(i => i.split(': '))
      .reduce((acc, [key, value]) => assign({[key]: value}, acc), {})
;


// getSecretA :: () -> Async e String
const getSecretA = () => execAsync('gopass ls --flat | rofi -dmenu -i -p "Choose secret"')
      .chain(getStdout)
      .map(secret => secret.replace(EOL, ''))
;


// getFieldA :: String -> Async e Object
const getFieldsA = secret => execAsync(`gopass show ${secret}`)
      .chain(getStdout)
      .map(parseGopassOutput)
;


// chooseFieldA :: Object -> Async e String
const chooseFieldA = fieldMap => Async((reject, resolve) => {

  let field = '';

  const sink = spawn('rofi', ['-dmenu', '-i', '-p', 'Choose Field'], {stdio: ['pipe', 'pipe', process.stderr]});

  Object
    .keys(fieldMap)
    .map(secret => `${secret}${EOL}`)
    .forEach(sink.stdin.write.bind(sink.stdin))
  ;

  sink.stdout.on('data', data => { field += data; });
  sink.stdout.on('error', (e) => { reject(e); });

  sink.on('close', (code) => (code > 0) ? reject(new Error('Nothing chosen')) : resolve(field.replace(EOL, '')))

  sink.stdin.end();
});

// getSecretFiled :: Async e Object
const getSecretFiled = getSecretA()
      .chain(
        secret => getFieldsA(secret)
          .chain(chooseFieldA)
          .map(field => ({secret, field}))
      )
;

// copyToClipboardA :: Object -> Async
const copyToClipboardA = ifElse(
  ({field}) => (field !== 'password'),
  ({field, secret}) => execAsync(`gopass show -c ${secret} ${field}`),
  ({secret}) => execAsync(`gopass show -c ${secret}`),
);


// main :: Async
const main = getSecretFiled
      .chain(copyToClipboardA)
      .chain(getStdout)
;

main.fork(log('Error:'), log('Success:'));
