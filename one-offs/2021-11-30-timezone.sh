#!/bin/bash

# Update the timezone, ensure that the updates happen at a reasonable hour

transactional-update run timedatectl set-timezone America/Indianapolis

