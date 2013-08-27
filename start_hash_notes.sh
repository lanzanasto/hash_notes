#!/bin/bash

rake ts:start
rake db:setup
rake ts:rebuild

rails s