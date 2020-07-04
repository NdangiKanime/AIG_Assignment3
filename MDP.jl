function GridWorld(init, transitionFunction )

    CELL_VOID = 0
    CELL_PIT = 1
    CELL_EXIT = 2
    CELL_WALL = 3
    cells = None
    size = (0, 0)  # (columns, rows)

    ACTION_NORTH = "N"
    ACTION_SOUTH = "S"
    ACTION_WEST = "W"
    ACTION_EAST = "E"
    actionSet = (ACTION_NORTH, ACTION_SOUTH, ACTION_WEST, ACTION_EAST)

    # Probabilities
    PROB_FORWARD = "F"
    PROB_BACKWARD = "B"
    PROB_LEFT = "L"
    PROB_RIGHT = "R"
    prob = None

    rew = None
    discFactor = 0

    # Drawing parameters
    drawing_BoxSide = 120
    drawing_BoxMargin = 2
    drawing_offset = (5, 5)
end
end

     init(self, cells, discountFactor=1)
        self.cells = cells
        self.size = (len(self.cells[0]), len(self.cells))
        self.discFactor = discountFactor
     end

     transitionFunction(self, position, action)
        if action not in self.actionSet
            raise Exception("unknown action")
        end
        if self.cells[position[1]][position[0]] != self.CELL_VOID
            raise Exception("no action allowed")
        end

        if action == self.ACTION_NORTH
            ris = (position[0], max(0, position[1] - 1))
                elseif action == self.ACTION_SOUTH
        end
            ris = (position[0], min(len(self.cells) - 1, position[1] + 1))
        elseif action == self.ACTION_WEST
            ris = (max(0, position[0] - 1), position[1])
        end
        else
            ris = (min(len(self.cells[0]) - 1, position[0] + 1), position[1])
        end

        if self.__cells[ris[1]][ris[0]] == self.CELL_WALL: return position
        return ris
        end

        cellTypeAt(self, x, y)
        return self.cells[y][x]
        end

        cellAt(self, x, y)
        """pos is a tuple (x,y)"""
        return self.__cells[y][x]
        end

        setDiscountFactor(self, df)
        self.discFactor = df
        end

        setRewards(self, rewOfVoidCell, rewOfPitCell, rewOfExitCell)
        self.rew = {self.CELL_VOID: rewOfVoidCell,
                    self.CELL_EXIT: rewOfExitCell,
                    self.CELL_PIT: rewOfPitCell,
                    self.CELL_WALL: 0}
        end

        setProbabilities(self, probToGoForward, probToGoLeft, probToGoRight, probToGoBackward)
        if probToGoForward + probToGoLeft + probToGoRight + probToGoBackward != 1
            raise Exception("the prob must have 1 as sum")
        end
        self.prob = {self.PROB_FORWARD: probToGoForward,
                     self.PROB_LEFT: probToGoLeft,
                     self.PROB_RIGHT: probToGoRight,
                     self.PROB_BACKWARD: probToGoBackward}
        end

        possiblePositionsFromAction(self, position, worldAction)

          getProbabilitiesFromAction(worldAction)
            if worldAction == self.ACTION_NORTH
                return {self.ACTION_NORTH: self.prob[self.PROB_FORWARD],
                        self.ACTION_SOUTH: self.prob[self.PROB_BACKWARD],
                        self.ACTION_WEST: self.prob[self.PROB_LEFT],
                        self.ACTION_EAST: self.prob[self.PROB_RIGHT]}
          end
          elseif worldAction == self.ACTION_SOUTH
                return {self.ACTION_NORTH: self.prob[self.PROB_BACKWARD],
                        self.ACTION_SOUTH: self.prob[self.PROB_FORWARD],
                        self.ACTION_WEST: self.prob[self.PROB_RIGHT],
                        self.ACTION_EAST: self.prob[self.PROB_LEFT]}
          end
          elseif worldAction == self.ACTION_WEST
                return {self.ACTION_NORTH: self.prob[self.PROB_RIGHT],
                        self.ACTION_SOUTH: self.prob[self.PROB_LEFT],
                        self.ACTION_WEST: self.prob[self.PROB_FORWARD],
                        self.ACTION_EAST: self.prob[self.PROB_BACKWARD]}
          end
            else
                return {self.ACTION_NORTH: self.prob[self.PROB_LEFT],
                        self.ACTION_SOUTH: self.prob[self.PROB_RIGHT],
                        self.ACTION_WEST: self.prob[self.PROB_BACKWARD],
                        self.ACTION_EAST: self.prob[self.PROB_FORWARD]}
          end

        if not (self.__cells[position[1]][position[0]] == self.CELL_VOID)
            return []  # we can do anything in the wall, in a pit or in a exit
        end

        prob = getProbabilitiesFromAction(worldAction)
        result = []
        for a in self.actionSet
            result.append((a, self.transitionFunction(position, a), prob[a]))
        return result
        end

    @staticmethod
        randomAction()
        return GridWorld.actionSet[int(random.random() * 4)]
        end

        rewardAtCell(self, x, y)
        return self.rew[self.cells[y][x]]
        end

        str(self)
        ris = ""
        numRows = len(self.__cells)
        for r in self.cells
            for c in r
                if c == self.CELL_EXIT
                    ris += "E "
            elseif c == self.CELL_PIT
                    ris += "P "
            elseif c == self.CELL_WALL
                    ris += "W "
                else
                    ris += "V "
            numRows -= 1
        end
            if numRows > 0: ris += "\n"
        return ris
            end

        newCanvasToDraw(self, master)
        width = self.drawing_offset[0] + self.size[0] * self.drawing_BoxSide + (self.size[0] - 1) * self.drawing_BoxMargin
        height = self.drawing_offset[1] + self.size[1] * self.drawing_BoxSide + (self.size[1] - 1) * self.drawing_BoxMargin
        return tkinter.Canvas(master, width=width, height=height)
            end

        draw(self, canvas)
        m = self.drawing_BoxMargin
        s = self.drawing_BoxSide
        ox, oy = self.drawing_offset
        for x in range(self.size[0])
            for y in range(self.size[1])
                xp, yp = x * (s + m) + ox, y * (s + m) + oy
                if self.__cells[y][x] == self.CELL_WALL
                    color = "#%02x%02x%02x" % (128, 128, 128)
                            elseif self.__cells[y][x] == self.CELL_EXIT
                    color = "#%02x%02x%02x" % (0, 255, 0)
                            elseif self.__cells[y][x] == self.CELL_PIT
                    color = "#%02x%02x%02x" % (255, 0, 0)
                else
                    color = "#%02x%02x%02x" % (255, 255, 255)
                canvas.create_rectangle(xp, yp, xp + s, yp + s, fill=color)
                        end
                    end
                end
            end


# ===========================================================================
# TEST
# ===========================================================================
    w = GridWorld([[GridWorld.CELL_VOID, GridWorld.CELL_VOID, GridWorld.CELL_VOID, GridWorld.CELL_EXIT],
                   [GridWorld.CELL_VOID, GridWorld.CELL_WALL, GridWorld.CELL_VOID, GridWorld.CELL_PIT],
                   [GridWorld.CELL_VOID, GridWorld.CELL_VOID, GridWorld.CELL_VOID, GridWorld.CELL_VOID]])

    print("GridWorld:")
    print(w)

    print("\nSome transitions:")
    print(w.transitionFunction((1, 0), GridWorld.ACTION_NORTH))
    print(w.transitionFunction((0, 0), GridWorld.ACTION_NORTH))
    print(w.transitionFunction((1, 0), GridWorld.ACTION_SOUTH))
    print(w.transitionFunction((1, 0), GridWorld.ACTION_SOUTH))

    w.setRewards(-0.04, -1, 1)
    w.setProbabilities(0.7, 0.1, 0.2, 0)

    print(w.possiblePositionsFromAction((0, 0), GridWorld.ACTION_NORTH))
    print(w.possiblePositionsFromAction((0, 0), GridWorld.ACTION_SOUTH))

    print(w.rewardAtCell(0, 0))
    print(w.rewardAtCell(1, 1))
    print(w.rewardAtCell(3, 0))
    print(w.rewardAtCell(3, 1))
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
