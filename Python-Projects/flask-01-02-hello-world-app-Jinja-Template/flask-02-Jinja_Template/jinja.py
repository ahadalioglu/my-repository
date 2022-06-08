from flask import Flask, render_template

app = Flask(__name__)

@app.route('/')
def head():
    return render_template('index.html', number1=34, number2=45)

@app.route('/ahad')
def fullname():
    fname='Ahad'
    lname='Mammadov'
    return render_template('body.html',fn=fname, ln=lname)
    
if __name__=="__main__":
    app.run(debug=True)