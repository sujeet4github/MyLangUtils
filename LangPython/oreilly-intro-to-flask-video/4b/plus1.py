from datetime import datetime
from flask import Flask, render_template, session, g
app = Flask(__name__)
# Need this CSRF protection, since we are using session, g
app.config['SECRET_KEY'] = 'a top secret!'


@app.before_request
def before_request():
    if 'count' not in session:
        session['count'] = 1
    else:
        session['count'] += 1
    g.when = datetime.now().strftime('%H:%M:%S')


@app.route('/')
def index():
    return render_template('index.html', count=session['count'], when=g.when)


@app.route('/other')
def other():
    return render_template('other.html', count=session['count'], when=g.when)


if __name__ == '__main__':
    app.run(debug=True)
