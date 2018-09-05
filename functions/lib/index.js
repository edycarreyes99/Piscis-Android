"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const functions = require("firebase-functions");
const admin = require("firebase-admin");
const sgMail = require("@sendgrid/mail");
admin.initializeApp(functions.config().firebase);
const db = admin.firestore();
const settings = { timestampsInSnapshots: true };
const SENDGRID_API_KEY = functions.config().sendgrid.key;
sgMail.setApiKey(SENDGRID_API_KEY);
db.settings(settings);
exports.FirebaseToFirestoreHistorial = functions.database.ref('/Historial/{id}').onCreate(data => {
    const datos = data.val();
    return db.collection('Piscis').doc('Historial').collection('Sensores').doc(data.key).set(datos);
});
exports.onAddUser = functions.auth.user().onCreate(user => {
    const usuario = user;
    var userID = usuario.uid;
    const msg = {
        to: user.email,
        from: 'pisciswebserver@gmail.com',
        subject: 'Nuevo Usuario Agregado',
        //custom templates
        templateId: 'd-04044740f59841e9b5d23021c0afa709',
        substitutionWrappers: ['{{', '}}'],
        substitutions: {
            name: user.email
        }
    };
    return sgMail.send(msg);
});
exports.onDeleteUser = functions.auth.user().onDelete(user => {
    const usuario = user;
    var userID = usuario.uid;
});
//# sourceMappingURL=index.js.map