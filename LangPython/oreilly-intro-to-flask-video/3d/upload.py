import os
import imghdr
from flask import Flask, render_template
from flask_bootstrap import Bootstrap
from flask_wtf import FlaskForm
from wtforms import FileField, SubmitField, ValidationError

app = Flask(__name__)
# setup encryption for token generation - prevent xref attacks
# need       {{ form.hidden_tag() }} in the index.html
app.config['SECRET_KEY'] = 'top secret!'
Bootstrap(app)


class UploadForm(FlaskForm):
    image_file = FileField('Image file')
    submit = SubmitField('Submit')

    def validate_image_field(self, field):
        if fielddata.filename[-4:].lower() != '.jpg':
            raise ValidationError('Invalid file extension')
        if imghdr.what(field.data) != 'jpeg':
            raise ValidationError('Invalid image format')


@app.route('/', methods=['GET', 'POST'])
def index():
    image = None
    form = UploadForm()
    if form.validate_on_submit():
        image = 'uploads/' + form.image_file.data.filename
        form.image_file.data.save(os.path.join(app.static_folder, image))
    return render_template('index.html', form=form, image=image)


if __name__ == '__main__':
    app.run(debug = True)
