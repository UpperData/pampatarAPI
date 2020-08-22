var nodemailer = require("nodemailer");
exports.sendEmail = function(req, res){
    // Definimos el transporter
        var transporter = nodemailer.createTransport({
            //service: 'Gmail',
           // secure: true,
            host: 'smtp.gmail.com',
            port: 587,
            //ignoreTLS: false,
            secure: false,
                        auth: {               
                user: 'upper.venezuela@gmail.com',
                pass: 'Lenovo070.'
            }
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