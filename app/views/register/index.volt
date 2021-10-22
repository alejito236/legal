
{{ content() }}

<div class="page-header">
    <h2>Registro de usuario Novus</h2>
</div>

{{ form('register', 'id': 'registerForm', 'onbeforesubmit': 'return false') }}

    <fieldset>

        <div class="control-group">
            <label for="">Nombre completo</label>
            <div class="controls">
                {{ form.render('name', ['class': 'form-control']) }}
                <p class="help-block">(required)</p>
                <div class="alert alert-warning" id="name_alert">
                    <strong>Warning!</strong> Please enter your full name
                </div>
            </div>
        </div>

        <div class="control-group">
            <label for="">Nombre de usuario</label>
            <div class="controls">
                {{ form.render('username', ['class': 'form-control']) }}
                <p class="help-block">(required)</p>
                <div class="alert alert-warning" id="username_alert">
                    <strong>Warning!</strong> Please enter your desired user name
                </div>
            </div>
        </div>

        <div class="control-group">
            <label for="">Correo</label>
            <div class="controls">
                {{ form.render('email', ['class': 'form-control']) }}
                <p class="help-block">(required)</p>
                <div class="alert alert-warning" id="email_alert">
                    <strong>Warning!</strong> Please enter your email
                </div>
            </div>
        </div>

        <div class="control-group">
            <label for="">Contraseña</label>
            <div class="controls">
                {{ form.render('password', ['class': 'form-control']) }}
                <p class="help-block">(minimum 8 characters)</p>
                <div class="alert alert-warning" id="password_alert">
                    <strong>Warning!</strong> Please provide a valid password
                </div>
            </div>
        </div>

        <div class="control-group">
            <label class="control-label" for="repeatPassword">Repite la contraseña</label>
            <div class="controls">
                {{ password_field('repeatPassword', 'class': 'form-control') }}
                <div class="alert" id="repeatPassword_alert">
                    <strong>Warning!</strong> The password does not match
                </div>
            </div>
        </div>

        <div class="coltrol-group">
            <label for="control-label">Rol</label>
            <div class="controls">
                <select name="role" id="" class="form-control">
                    <option value="">Seleccione..</option>
                    <option value="1">Administrador</option>
                    <option value="2">Asesor</option>
                    <option value="3">Poblador</option>
                </select>
            </div>
        </div>

        <div class="form-actions">
            <br>
            {{ submit_button('Register', 'class': 'btn btn-primary', 'onclick': 'return SignUp.validate();') }}
            <p class="help-block">Al registrarte, aceptas los términos de uso y la política de privacidad..</p>
        </div>

    </fieldset>
</form>
