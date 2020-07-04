function Variable(object)
      initiate(self, name, domain)
      self.name = name
      self.domain = domain

      function Constraint(object)
      initiate(self, variables)
      self.variables = variables
      check(self, values)
      return true

      function AllDifferentConstraint(Constraint)
      check(self, values)
      if len(values) == 0
      return true
      end
      v = None
      for val in values
          if v isassigned None
              v = val
          elseif val == v
             return false
          end
          return true
      end

      function AllEqualConstraint(Contraint)
      check(self, values)
      if len(values) == 0
         return true
      end
      v = values[0]
      for val in values
          if v != val
              return false
          end
          return true
      end
      # Optimization by forward checking variables
      # Constraint function
      # In: values
      # Out: True / false
      # Check if values match constraint

      # Return a sub set of d with only the items whose key is in the key arrays
      filter_dictionary(d, keys)
      return {k: v for (k, v) in d.items() if k in keys}

      dictionary_to_array(d)
      return [v for (k, v) in d.items()]

      union(d1, d2)
      d = d1.copy()
      d.update(d2)
      return d
      end

      union_arr(a, b)
      #return union of two lists
      return list(set(a) | set(b))
      end

      function Problem(object)
      initiate(self)
      self.variables = []
      self.constraints = []

      add_variable(self, variable)
      self.variables.append(variable)
      end

      add_constraint(self, constraint)
      self.constraints.append(constraint)
      end

      check_consisency(self, assignment)
      for constraint in self.constraints
          relevantValues = filter_dictionary(assignment, constraint, variables)
          if not constraint.check(dictionary_to_array(relevantValues))
              return false
          end
      return true
      end

      find(self, assignment, _v)
      vars = _v.copy() #passed by reference create a copy
      if len(vars) === 0
         return [assignment]
      end
      var = vars.pop()
      results = []
      for option in var.domain
          new_assignment = union(assignmen, {var.name: option})
          if self.check_consistency(new_assignment)
          res = self.find(new_assignment, vars)
          results += res
      return results
      end
      end

      get_Solutions(self)
      return self.find({}, self.variables.copy())
  end
