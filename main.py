from flask import Flask,jsonify, request

app = Flask(__name__)

@app.route('/suma', methods=['POST'])
def suma():
    return jsonify({"resultado":request.json['number1']+request.json['number2']})    

@app.route('/resta', methods=['POST'])
def resta():
    return jsonify({"resultado":request.json['number1']-request.json['number2']})    

@app.route('/multiplicacion', methods=['POST'])
def multiplicacion():
    return jsonify({"resultado":request.json['number1']*request.json['number2']})    
if __name__ == '__main__':
    app.run(debug=True, port =3000)
