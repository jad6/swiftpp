//
//  test.cpp
//  cpp
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

#include "test.hpp"

namespace jad {

  Test::Test(const std::string &greeting) : greeting_(greeting) {

  }

  Test::~Test() { }

  const std::string Test::SayHelloTo(const std::vector<std::string> *names) const {
    std::string hello_string;

    if (names != NULL) {
      const int names_size = (int)names->size();
      for (int i = 0; i < names_size; ++i) {
        hello_string += (*names)[i];

        if (i < names_size - 2) {
          hello_string += " & ";
        } else if (i != names_size - 1) {
          hello_string += ", ";
        }
      }
    }

    return greeting_ + " " + hello_string;
  }
} // jad
