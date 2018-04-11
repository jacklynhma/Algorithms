# import pdb

def test(answer):
    if( answer == 8 ):
        return "Correct"
    else:
        return( 'Result: %s' %answer )

def binary_search(array, x):
    max = len(array) - 1
    min = 0

    answer = ""

    while( answer == "" ):
        middle_index = int(round( min + ( (max - min)/2 ) ) )

        if(x == array[middle_index]):
            answer = middle_index
        elif(max - min == 1):
            if(array[max] != x and array[min] != x):
                answer = "x does not exist in the array"
            else:
                middle_index = max
                answer = middle_index
        elif( array[middle_index] < x ):
            min = middle_index
        elif( array[middle_index] > x ):
            max = middle_index
    return answer


x = 50
array = [2, 4, 6, 8, 12, 19, 20, 30, 50, 93, 100, 200]

answer = binary_search(array, x)
print(test(answer))

# total RunTime: 0.059
