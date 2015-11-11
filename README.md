# drupal-offline-status-gpio-esp

[![Build Status](https://travis-ci.org/eiriksm/drupal-offline-status-gpio-esp.svg?branch=master)](https://travis-ci.org/eiriksm/drupal-offline-status-gpio-esp)

## What is it?
It's a simple script that runs on the ESP8266 that changes a LED from red to green (and back) depending on if a site responds with the status code of 200.

## Requirements

- ESP8266 with nodemcu flashed. [I used this tutorial for OSX](https://github.com/nodemcu/nodemcu-devkit/wiki/Getting-Started-on-OSX)
- A tool to upload the files to your ESP. For example [ESPlorer](http://esp8266.ru/esplorer/)

## Usage

- Copy the `default.config.lua` file to `config.lua` and fill in with your values.
- Upload all the files to your esp.
- It *should* work now...

## Why does it have drupal in the repo name? This has nothing to do with Drupal!

Correct. I was using it when speaking about Drupal and the Internet of Things on Drupalcamp Oslo 2015. So that is all the Drupal connection it has.
