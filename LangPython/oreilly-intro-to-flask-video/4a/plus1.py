from flask import Flask, render_template, session
app = Flask(__name__)
# Need this CSRF protection, since we are using session
app.config['SECRET_KEY'] = 'a top secret!'


@app.route('/')
def index():
    if 'count' not in session:
        session['count'] = 1
    else:
        session['count'] += 1
    return render_template('index.html', count=session['count'])

if __name__ == '__main__':
    app.run(debug=True)
