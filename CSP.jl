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
          if v == None
              v = val
          elseif val == v
             return false
          end
          return true
      end

      function AllEqualConstraint(Constraint)
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

   problem = Problem()

   colors = ["blue","green","red"]
   states = ["WA","NT","Q","NSW","V","SA","T"]

   for state in states
       problem.add_variable(Variable(state, colors))

   problem.add_constraint(AllDifferentConstraint(["WA", "NT"]))
   problem.add_constraint(AllDifferentConstraint(["WA", "SA"]))
   problem.add_constraint(AllDifferentConstraint(["NT", "SA"]))
   problem.add_constraint(AllDifferentConstraint(["NT", "Q"]))
   problem.add_constraint(AllDifferentConstraint(["SA", "Q"]))
   problem.add_constraint(AllDifferentConstraint(["SA", "NSW"]))
   problem.add_constraint(AllDifferentConstraint(["SA", "V"]))
   problem.add_constraint(AllDifferentConstraint(["Q", "NSW"]))
   problem.add_constraint(AllDifferentConstraint(["V", "NSW"]))

   print(problem.get_Solutions()[0])
   end
