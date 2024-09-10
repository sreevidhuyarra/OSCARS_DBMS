import pymysql
import pymysql.cursors
import maskpass
import common as com
import selection as sel
import projection as proj
import aggregate as agg
import search as srch
import analysis as ana
import insert as inst
import update as updt
import delete as delt


def retrieve():
    with con.cursor() as cur:
        com.clr_screen()
        print("1 - selection")
        print("2 - projection")
        print("3 - aggregate")
        print("4 - search")
        print("5 - analysis")
        print("6 - go back")
        ch = int(input("what kind of information do you want? "))
        ret = 0
        match ch:
            case 1:
                ret = sel.drive(con)
            case 2:
                ret = proj.drive(con)
            case 3:
                ret = agg.drive(con)
            case 4:
                ret = srch.drive(con)
            case 5:
                ret = ana.drive(con)
            case 6:
                return
            case _:
                print("sorry, that is not a valid option")
        if ret == 1:
            com.cont()
        else:
            retrieve()


def modify():
    with con.cursor() as cur:
        com.clr_screen()
        print("1 - insertion")
        print("2 - updation")
        print("3 - deletion")
        print("4 - go back")
        ch = int(input("what kind of changes do you want to do? "))
        ret = 0
        match ch:
            case 1:
                ret = inst.drive(con)
            case 2:
                ret = updt.drive(con)
            case 3:
                ret = delt.drive(con)
            case 4:
                return
            case _:
                print("sorry, that is not a valid option")
        if ret == 1:
            com.cont()
        else:
            modify()


while 1:
    com.clr_screen()

    usr = input("enter username: ")
    pw = maskpass.askpass(prompt="enter password: ", mask="")

    try:
        con = pymysql.connect(
            host="localhost",
            user=usr,
            password=pw,
            db="phase_4",
            cursorclass=pymysql.cursors.DictCursor,
        )
        com.clr_screen()
        if con.open:
            print("connected")
        else:
            print("connection failed")
        com.cont()

        with con.cursor() as cur:
            while 1:
                com.clr_screen()
                print("1 - modify the database")
                print("2 - retrieve from the database")
                print("3 - exit")
                ch = int(input("what is your command? "))
                com.clr_screen()
                if ch == 3:
                    print("good bye friend :)")
                    exit()
                elif ch == 2:
                    retrieve()
                elif ch == 1:
                    modify()
                else:
                    print("sorry, that is not a valid option")
                    com.cont()

    except Exception as e:
        com.clr_screen()
        print(e)
        print("possible issues: ")
        print("username or password is incorrect")
        print("user does not have access to database")
        com.cont()
