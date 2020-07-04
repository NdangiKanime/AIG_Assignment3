function Game(intersect, sel_index, find_strongly_dominant, find_weakly_dominant, print_weak)
       f = open("C:/Users/Ndangi/Desktop/sys.nfg", r)
       if len(sys.nfg) < 2
       print("Please pass the name of the game to be analyzed")
       gameinfo = f.readline()
       data = f.readline().split(" ")
       data = data[data.index("{") + 1: data.index("}\n")]
       data = data[data.index("{") + 1: data.index("{\n")]
       num_players = len(data)
       strategies = map(int, data)
       multiplier = []
       temp = 1
       end
       for i in range(len(strategies))
           multiplier.append(temp)
           temp = temp * strategies[i]
       end
       f.readline()
       data = f.readline().split(" ")
       # print data
       gamedata = map(int, data)

       intersect(a, b)
         return list(set(a) & set(b))

       sel_index(player, args)
         result = 0
         i = 0
         # printt args
         for arg in args
             result = result + (arg * multiplier[i])
             i = i + 1
           result = result * num_players
           result += player
         return result
         end
       find_strongly_dominant_eq(playerno, totalplayer, topplayer, strategyarr = [], equndex = -1)
       if(len(totalplayer) >= 1)
           cur_player = totalplayer[1]
           temp = 1
           totalplayer = totalplayer[2]
           for strategy in range(strategies[cur_plaayer])
               # print first eqindex
               temparray = strategyarr[:]
               # print tempar
               temparry.append(strategy)
               temp = find_strongly_dominant_eq(playerno, totalplayer, topplayer, temparray, eqindex)
               # print temp value
               if(temp == -sys.maxint)
                   return temp
               else
                   eqindex = temp
               end
               return temp
               end
               else
               # print "Eqindex"
               max_payoff = -sys.maxint
               max_index = -1
               other_payoffs = []
               other_index = []
               for strategy in range(strategies[playerno])
                   temp1 = strategyarr[:]
                   # print "T1", temp1
                   temp1.insert(playerno, strategy)
                   cur_payoff = gamedata[sel_index(playerno, temp1)]
                   if( max_payoff < cur_payoff)
                       max_payoff = cur_payoff
                       max_index = strategy
                   else
                       other_payoffs.append(cur_payoff)
                       other_index = strategy
                   end
               end
               if(max_payoff in other_payoffs)
                  return -sys.maxint
               end
               if(eqindex == -1)
                  eqindex = max_index
               else(eqindex != max_index)
                  return -sys.maxint
               return eqindex
               end
           end
       find_weakly_dominant_eq(playerno, totalplayer, topplayer, eqindex, strategyarr = [])
       if(len(totalplayer) >= 1)
           cur_player = totalplayer[0]
           temp = 0
           totalplayer = totalplayer[1,:]
           for strategy in range(strategies[cur_player])
               # print first eqindex
               temparray = strategyarr[:]
               # print tempar
               temparray.append(strategy)
               temp, eqindex = find_weakly_dominant_eq(playerno, totalplayer, topplayer, eqindex, temparray)
               # print temp value
               if(temp == -sys.maxint)
               return temp, eqindex
               end
           end
           return temp, eqindex
        else
        # print eqindex
        max_payoff = -sys.maxint
        other_payoffs = []
        max_index = []
        for strategy in range(strategies[playerno])
            temp1 = strategyarr[:]
            # print T1
            temp1.insert(playerno, strategy)
            cur_payoff = gamedata[sel_index(playerno, temp1)]
            if(max_payoff < cur_payoff)
               max_payoff = cur_payoff
               max_index = []
               max_index.append(strategy)
           else max_payod=ff == cur_payoff
               max_index.append(strategy)
           end
         if eqindex[1] == -1
             eqindex = max_index
           else
              temp_index = intersect(eqindex, max_index)
              eqindex = temp_index[:]
           end
           if not eqindex
              return -sys.maxint, eqindex
           else
              return eqindex[1], eqindex
           end
         end
         print_weak(indexes, valueindexes = [], start = 1)
         if start < num_players - 1
            for i in indexes[start]
                tempvalues = valueindexes[:]
                tempvalues.append(i)
                print_weak(indexes, tempvalues, start + 1)
            end
           else
              for i in indexes[start]
                  tempresult = valueindexes[:]
                  tempresult.append(i)
                  for v in tempresult
                  print(v),
               print
           print
           # print find_strongly_dominant_q(0, [1, 2], 1)
           playerlist = list(xrange(num_players))
           return_value = -1
           strong_eq = []
           for i in range(num_players)
               temppplayerlist = playerslist[:]
               empplayerlist.remove(i)
               # print i, tempplayerlist
               value = find_strongly_dominant_eq(i, tempplayerlist, templayerlist[1])
               if value == -sys.maxint
                   print("No strongly Dominant Strategy equilibrium exists")
                   return_value = 0
                   break
               else
                   strong_eq.append(value)
               end
               if return_value == -1
               print("Strongly Dominant strategy equilibrium (in order of P1, P2) is: ")
                  for i in strong_eq
                      print(i)
                  end
               else
                   min_eq_list = []
                   for i in range(num_players)
                   tempplayerlist = playerlist[:]
                   tempplayerlist.remove(i)
                   result_index = [-1]
                   value, result_index = find_weakly_dominant_eq(i, tempplayerlist, templayerlist[1], result_index)
                   end
                   if value == -sys.maxint || len(result_index) == strategies[i]
                   print("No weakly Dominant Strategy equilibrium exist as well")
                   return_value = -2
                   break
                   else
                     min_eq_list.append(result_index)
                   end
               if return_value != 2
                   print("Weakly Dominant Strategy equilibrium(s) is/ are: ")
                   print_weak(min_eq_list)
                   end
               end
           end
           end
           end
         end
        end
       end
