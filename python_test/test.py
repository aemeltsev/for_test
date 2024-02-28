import psycopg2 as ps
import sys

args = []
for param in sys.argv:
    args.append(param)
out = []

connection = ps.connect(
    host = 'localhost',
    user = 'postgres', 
    password = 'pswd',
	database = "eshop"
)

cursor = connection.cursor()

request_to_read_data = \
"	SELECT product.product_name, product.product_id, orders.number_id, orders.product_vol, rack.rack_name, product_rack.product_add_rack \
    FROM product_rack \
	INNER JOIN product ON product_rack.product_id = product.product_id \
	INNER JOIN orders ON product_rack.order_id = orders.order_id \
	INNER JOIN rack ON product_rack.rack_id = rack.rack_id \
	WHERE rack.rack_id = %s AND orders.number_id = %s \
"
for var in range(1, 9):
    for i in range(1, 5):
        cursor.execute(request_to_read_data, (var, args[i]))
        data = cursor.fetchall()
        if(len(data) != 0):
            out.append(data)

print("=+=+=+=")
print("Страница сборки заказов " + args[1] + ", " + args[2] + ", " + args[3] + ", " + args[4])
list_size = len(out)
products = [out[i][0][0] for i in range(len(out))]
id_products = [out[i][0][1] for i in range(len(out))]
order_num = [out[i][0][2] for i in range(len(out))]
volume = [out[i][0][3] for i in range(len(out))]
name_rack = [out[i][0][4] for i in range(len(out))]
add_rack = [out[i][0][5] for i in range(len(out))]

for i in range(list_size):
    if(i == 0):
        print("===Стеллаж " + name_rack[i])
        print(str(products[i]) + " (id=" + str(id_products[i]) + ")")
        print("заказ " + str(order_num[i]) + ", " + str(volume[i]) + "шт")
        if add_rack[i] != "":
            print("доп стеллаж: " + add_rack[i])
        print("\n")
    elif(i>0 and name_rack[i-1] == name_rack[i]):
        print(str(products[i]) + " (id=" + str(id_products[i]) + ")")
        print("заказ " + str(order_num[i]) + ", " + str(volume[i]) + "шт")
        if add_rack[i] != "":
            print("доп стеллаж: " + add_rack[i])
        print("\n")
    else:
        print("===Стеллаж " + name_rack[i])
        print(str(products[i]) + " (id=" + str(id_products[i]) + ")")
        print("заказ " + str(order_num[i]) + ", " + str(volume[i]) + "шт")
        if add_rack[i] != "":
            print("доп стеллаж: " + add_rack[i])
        print("\n")

cursor.close()
connection.close()