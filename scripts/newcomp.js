#!/usr/bin/env node
const fs = require('fs');
const path = require('path');
const Handlebars = require('handlebars');

const templatesFolder = path.join(__dirname, '../templates');

const templates = {
  component: fs.readFileSync(path.join(templatesFolder, 'component.jsx'), 'utf8'),
  styled: fs.readFileSync(path.join(templatesFolder, 'styled.js'), 'utf8'),
  test: fs.readFileSync(path.join(templatesFolder, 'test.js'), 'utf8'),
  story: fs.readFileSync(path.join(templatesFolder, 'story.jsx'), 'utf8'),
};

const args = process.argv.slice(2);
const [componentName, native] = args;

const copy = (file, ext) => {
  const folder = `${process.cwd()}/${componentName}`;

  const template = Handlebars.compile(file)({ componentName });
  const to = `${folder}/${componentName}${ext}`;

  if (!fs.existsSync(folder)) fs.mkdirSync(folder);
  else console.warn('Folder already exists.. it may override your stuff.');

  return fs.writeFileSync(to, template, 'utf8');
}

(() => {
  copy(templates.component, '.jsx');
  copy(templates.styled, '.styled.js');
  copy(templates.test, '.test.js');
  copy(templates.story, '.story.jsx');
})()

process.exit(0);
