//
//  JOTest.m
//  Objc
//
//  The MIT License (MIT)
//
//  Copyright (c) 2016 Jad Osseiran
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

#import "JOTest.h"

#include "cpp/test.hpp"

@interface JOTest ()

@property (nonatomic, readonly) jad::Test *_test;

@end

@implementation JOTest

- (instancetype)initWithGreeting:(NSString *)greeting {
  self = [super init];
  if (self != nil) {
    self->__test = new jad::Test([greeting UTF8String]);
  }
  return self;
}

- (instancetype)init {
  return [self initWithGreeting:[[NSString alloc] init]];
}

- (void)dealloc {
  delete self->__test;
}

- (NSString *)sayHelloTo:(nullable NSArray<NSString *> *)names {
  std::string _hello_string;

  if (names != nil) {
    std::vector<std::string> _names;
    for (NSString *name in names) {
      _names.push_back([name UTF8String]);
    }

    _hello_string = self->__test->SayHelloTo(&_names);
  } else {
    _hello_string = self->__test->SayHelloTo(NULL);
  }

  return [[NSString alloc] initWithUTF8String:_hello_string.c_str()];
}

@end
