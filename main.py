import json
from flask import Flask, jsonify
from flask_mysqldb import MySQL
import pymysql
from app import app
from config import mysql
from flask import jsonify
from flask import flash, request

app = Flask(__name__)


conexion = MySQL(app)

def obtener_conexion():
    return pymysql.connect(host='localhost',
    user='root',
    password='Mario.crv208',
    bd='P1_201908338')

@app.route('/')
def index():
    return 'BIENVENIDO A NUESTRO CONSULTORIO :V' 


@app.route('/informacion')
def informacion():
    return jsonify({"Informacion":"Mario Jose Rodriguez Vasquez - 201908338"})

#CONSULTA 1
@app.route('/Consulta1', methods=['GET'])
def Consulta1():
    try: 
        conn = mysql.connect()
        cursor = conn.cursor(pymysql.cursors.DictCursor)
        cursor.callproc('Consulta1')
        datos = cursor.fetchall()
        response = jsonify(datos)
        return response
    except Exception as ex:
        return jsonify({"mensaje": "Error"})
    finally:
        cursor.close()
        conn.close()


#CONSULTA 2
@app.route('/Consulta2', methods=['GET'])
def Consulta2():
    try: 
        conn = mysql.connect()
        cursor = conn.cursor(pymysql.cursors.DictCursor)
        cursor.callproc('Consulta2')
        datos = cursor.fetchall()
        response = jsonify(datos)
        return response
    except Exception as ex:
        return jsonify({"mensaje": "Error"})
    finally:
        cursor.close()
        conn.close()

        
#CONSULTA 3
@app.route('/Consulta3', methods=['GET'])
def Consulta3():
    try: 
        conn = mysql.connect()
        cursor = conn.cursor(pymysql.cursors.DictCursor)
        cursor.callproc('Consulta3')
        datos = cursor.fetchall()
        response = jsonify(datos)
        return response
    except Exception as ex:
        return jsonify({"mensaje": "Error"})
    finally:
        cursor.close()
        conn.close()

        
#CONSULTA 4
@app.route('/Consulta4', methods=['GET'])
def Consulta4():
    try: 
        conn = mysql.connect()
        cursor = conn.cursor(pymysql.cursors.DictCursor)
        cursor.callproc('Consulta4')
        datos = cursor.fetchall()
        response = jsonify(datos)
        return response
    except Exception as ex:
        return jsonify({"mensaje": "Error"})
    finally:
        cursor.close()
        conn.close()

        
#CONSULTA 5
@app.route('/Consulta5', methods=['GET'])
def Consulta5():
    try: 
        conn = mysql.connect()
        cursor = conn.cursor(pymysql.cursors.DictCursor)
        cursor.callproc('Consulta5')
        datos = cursor.fetchall()
        response = jsonify(datos)
        return response
    except Exception as ex:
        return jsonify({"mensaje": "Error"})
    finally:
        cursor.close()
        conn.close()

        
#CONSULTA 6
@app.route('/Consulta6', methods=['GET'])
def Consulta6():
    try: 
        conn = mysql.connect()
        cursor = conn.cursor(pymysql.cursors.DictCursor)
        cursor.callproc('Consulta6')
        datos = cursor.fetchall()
        response = jsonify(datos)
        return response
    except Exception as ex:
        return jsonify({"mensaje": "Error"})
    finally:
        cursor.close()
        conn.close()

        
#CONSULTA 7
@app.route('/Consulta7', methods=['GET'])
def Consulta7():
    try: 
        conn = mysql.connect()
        cursor = conn.cursor(pymysql.cursors.DictCursor)
        cursor.callproc('Consulta7')
        datos = cursor.fetchall()
        response = jsonify(datos)
        return response
    except Exception as ex:
        return jsonify({"mensaje": "Error"})
    finally:
        cursor.close()
        conn.close()

        
#CONSULTA 8
@app.route('/Consulta8', methods=['GET'])
def Consulta8():
    try: 
        conn = mysql.connect()
        cursor = conn.cursor(pymysql.cursors.DictCursor)
        cursor.callproc('Consulta8')
        datos = cursor.fetchall()
        response = jsonify(datos)
        return response
    except Exception as ex:
        return jsonify({"mensaje": "Error"})
    finally:
        cursor.close()
        conn.close()

        
#CONSULTA 9
@app.route('/Consulta9', methods=['GET'])
def Consulta9():
    try: 
        conn = mysql.connect()
        cursor = conn.cursor(pymysql.cursors.DictCursor)
        cursor.callproc('Consulta9')
        datos = cursor.fetchall()
        response = jsonify(datos)
        return response
    except Exception as ex:
        return jsonify({"mensaje": "Error"})
    finally:
        cursor.close()
        conn.close()

        
#CONSULTA 10
@app.route('/Consulta10', methods=['GET'])
def Consulta10():
    try: 
        conn = mysql.connect()
        cursor = conn.cursor(pymysql.cursors.DictCursor)
        cursor.callproc('Consulta10')
        datos = cursor.fetchall()
        response = jsonify(datos)
        return response
    except Exception as ex:
        return jsonify({"mensaje": "Error"})
    finally:
        cursor.close()
        conn.close()



def pagina_no_encontrada(error):
    return "404. Endpoint no encontrado", 404

if __name__ == '__main__':
    app.register_error_handler(404, pagina_no_encontrada)
    app.run(port = 3000, debug = True)
