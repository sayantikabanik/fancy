#ifndef _INCLUDES_H_
#define _INCLUDES_H_

#include <gc/gc.h>
#include <gc/gc_cpp.h>
#include <gc/gc_allocator.h>


#define PRINT_DEBUG 0

#include <cstdarg>
#include <cstdio>
#include <cstring>
#include <cstdlib>
#include <cassert>
#include <string>
#include <sstream>
#include <map>
#include <list>
#include <vector>
#include <iostream>
#include <algorithm>
#include <cctype>

using namespace std;

#include "callable.h"
#include "expression.h"
#include "native_object.h"
#include "fancy_object.h"
#include "expression_list.h"
#include "array.h"
#include "array_literal.h"
#include "nil.h"
#include "true.h"
#include "identifier.h"
#include "symbol.h"
#include "method.h"
#include "string.h"
#include "number.h"
#include "hash.h"
#include "regex.h"
#include "file.h"

#include "native_method.h"
#include "block.h"
#include "module.h"
#include "class.h"
#include "class_definition.h"
#include "scope.h"
#include "bootstrap/core_classes.h"
#include "method_call.h"
#include "operator_call.h"
#include "assignment.h"
#include "method_definition.h"
#include "errors.h"
#include "utils.h"


#endif /* _INCLUDES_H_ */
