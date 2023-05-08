##############################################################
##					Mathematical Optimization				## 
## 					J.P Zaldivar & E. Millán				##
##############################################################

import sys


def process_file(raw_file, nu):
    rf = open(raw_file, "r")

    # Create dat file
    prop = raw_file.split("_")
    pf = open(prop[0] + "_" + prop[1] + ".dat", "w")

    # Write heading
    pf.write("##############################################################\n")
    pf.write("##					Mathematical Optimization				##\n")
    pf.write("## 					J.P Zaldivar & E. Millán				##\n")
    pf.write("##############################################################\n\n")

    # read each line of rf and store the four first doubles in a list called A and the last double in a list called y
    A = []; y = []
    for line in rf:
        line = line.split()
        A.append(line[:4])
        # some lines, in the 4th element have a '*' character at the end of the string, so we remove it
        if '*' in line[4]:
            line[4] = line[4][:-1]
        y.append(line[4])

    # write each element of A and y in the dat file
    pf.write("param m := " + str(len(A)) + ";\n")
    pf.write("param n := " + str(len(A[0])) + ";\n")
    pf.write("param nu := " + nu + ";\n\n")
    
    pf.write("param y :=\n")
    for i in range(len(y)):
        pf.write(str(i+1) + "\t" + str(y[i]) + "\n")
    pf.write(";\n")

    pf.write("param A : 1 2 3 4 :=\n")
    for i in range(len(A)):
        pf.write(str(i+1) + "\t")
        for j in range(len(A[0])):
            pf.write(str(A[i][j]) + " ")
        pf.write("\n")
    pf.write(";\n")


def main():
    if len(sys.argv) != 3:
        print("Usage: python process_dat.py raw_file nu")
        sys.exit(1)

    raw_file = sys.argv[1]
    nu = sys.argv[2]
    process_file(raw_file, nu)


if __name__ == "__main__":
    main()

