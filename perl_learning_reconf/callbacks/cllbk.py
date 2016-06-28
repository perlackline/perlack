#!/usr/bin/python
# -*- coding: utf-8 -*-

def my_callback(val):
  print("function my_callback was called with {}".format(val))

def caller(val, func):
  func(val)

for i in range(5,7):
  caller(i, my_callback)

