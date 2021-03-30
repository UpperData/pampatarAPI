var nodemailer = require("nodemailer");
require ('dotenv').config();
exports.sendEmail = function(req, res){
    // Definimos el transporter
        var transporter = nodemailer.createTransport({
            //service: 'Gmail',
            //pool: true,
            //secure: false,
           // secureConnection: false,
            host: 'smtp.office365.com',
            port: 587,
            //ignoreTLS: false,
            secure: false,
            auth: {               
                user: process.env.EMAIL_ADMIN,
                pass: process.env.PASS_EMAIL_ADMIN                
            },
            debug: true,
            tls: {
                ciphers: 'SSLv3'
            }
            /*auth: {
                type: 'OAuth2',
                clientId: '366478346804-ee0cb9d2vad0ls8sr7q6romb13bt50o3.apps.googleusercontent.com',
                clientSecret: '7ES468aBwFFVjJH3UHAs5efY'
            }*/
        });
    // Definimos el email
    var mailOptions = {
        
        from: req.from,
        to: req.to,
        subject: req.subject,
        text: req.text,
        html:req.html
        
    };
    // Enviamos el email
    return transporter.sendMail(mailOptions)
};