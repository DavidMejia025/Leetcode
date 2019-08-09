# @param {Integer[][]} matrix
# @return {Integer[]}
def spiral_order(matrix)
    return []     if matrix == []
    return matrix[0] if matrix.length == 1


    length_x   = matrix[0].length
    length_y   = matrix.length
    distance_x = 0
    distance_y = 0
    direction  = 1
    new_array  = []

    i = 0
    j = 0
    k = 0

    new_array_length = length_x*length_y

    while k < (length_x*length_y)
        new_array[k] = matrix[j][i]

        if direction == 1
               if i+1 != length_x - distance_x
                   i += 1
               elsif j+1 == length_y - distance_y
                   direction = -1
                   i -= 1
               else
                   j += 1
               end
        else
            if i - 1 != distance_x - 1
                i -= 1
            elsif j-1 ==  distance_y
                direction   = 1
                distance_x += 1
                distance_y += 1

                i += 1
            else
                p j -= 1
            end
        end

        k += 1
    end

    new_array
end

