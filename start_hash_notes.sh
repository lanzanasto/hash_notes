#!/bin/bash

rake ts:restart
rake db:setup
rake ts:rebuild

rails s