def class Array {

  def Array new: size with: default {
    "Create a new Array with a given size and default-value.";

    Array new: ~[size, default]
  };

  # methods already existing on Array in ruby
  self method: "each" .  docstring=: "See ruby Array#each";
  self method: "==" . docstring=: "See ruby Array#==";
  self method: "clear" . docstring=: "See ruby Array#clear";
  self method: "size" . docstring=: "See ruby Array#size";
  self method: "at" . docstring=: "See ruby Array#at";
  self method: "indices" . docstring=: "See ruby Array#indices";
  self method: "first" . docstring=: "See ruby Array#first";
  self method: "reject!" . docstring=: "See ruby Array#reject!";
  self method: "select" . docstring=: "See ruby Array#select";
  self method: "<<" . docstring=: "See ruby Array#<<";

  def append: arr {
    "Appends another Array onto this one.";

    # TODO: should this method return a copy, or append to self and return self ?

    arr is_a? Array . if_true: {

      arr each: |other| {
        self << other
      };

      tmp # does the method return this ?

    } else: {
      nil
    }

  }

  def clone {
    "Clones (shallow copy) the Array."
    # TODO: implement
  }

  def remove_at: obj {
    """Removes an element at a given index. \
     If given an Array of indices, removes all the elements with these indices. \
     Returns the deleted object if an index was given, the last deleted object for an Array given.""";

    obj is_a?: Number . if_true: {

      self delete_at: obj # call to ruby-Array#delete_at

    } else: {

      obj is_a?: Array . if_true: {

        obj each: |idx| {
          self delete_at: obj # call to ruby-Array#delete_at
        }

      }

    }

  }


  def second {
    "Returns the second element in the Array";
    self at: 1
  }

  def third {
    "Returns the third element in the Array";
    self at: 2
  }

  def fourth {
    "Returns the fourth element in the Array";
    self at: 3
  }

  def indices: item {
     "Returns an Array of all indices of this item."
    # TODO: implement
  }


  def from: from to: to {
    "Returns sub-array starting at from: and going to to:"
    # TODO: implement
  }

  def last {
    "Returns the last element in the Array."
    # TODO: implement
  }

  def last: count {
    "Returns new Array with last n elements specified."
    # TODO: implement
  }

  def any?: block {
    "Takes condition-block and returns true if any element meets it."
    # TODO: implement
  }

  def all?: block {
    "Takes condition-block and returns true if all elements meet it."
    # TODO: implement
  }


  def select_with_index: index {
    "Same as select, just gets also called with an additional argument for each element's index value."
    # TODO: implement
  }

}
