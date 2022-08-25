from flask import Flask,jsonify

app = Flask(__name__)

@app.route('/informacion')
def informacion():
    return jsonify({"Informacion":"Ariel Macario - 201905837"})

if __name__ == '__main__':
    app.run(debug=True,port=4000)
