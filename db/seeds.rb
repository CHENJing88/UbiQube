# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
e1=EtatApp.create(nom:"Bon")
e2=EtatApp.create(nom:"En panne")
e3=EtatApp.create(nom:"Maintenance")


ep1=EtapeApp.create(nom:"Brouillion")
<<<<<<< HEAD
ep2=EtatApp.create(nom:"En cours de validation")
ep3=EtatApp.create(nom:"Validé")
ep4=EtatApp.create(nom:"Refusé")
ep5=EtatApp.create(nom:"Archivé")
=======
ep2=EtapeApp.create(nom:"En cours de validation")
ep3=EtapeApp.create(nom:"Validé")
ep4=EtapeApp.create(nom:"Refusé")
ep5=EtapeApp.create(nom:"Archivé")
>>>>>>> e633d8ddccafbf0d9d8b4a50477eb98ab61a0205

gu1=GroupeUser.create(nom:"EDTIC")

App.create(nom:"lifray", niveau:"font", etat_app_id:e1.id, etape_id:ep1.id, groupe_user_id: g1.id)
App.create(nom:"SSH", niveau:"mid", etat_app_id:e3.id, etape_id:ep2.id, groupe_user_id: g1.id)

r1=Role.create(nom: "utilisateur")
r2=Role.create(nom: "Administrateur")
r3=Role.create(nom: "Responsable Fonctionnel")
r4=Role.create(nom: "Responsable Technique")

UserAppRoles.create(user_id:2,app_id:1,role_id:1)
UserAppRoles.create(user_id:2,app_id:2,role_id:1)
