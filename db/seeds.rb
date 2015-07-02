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

Application.create(nom:"Ubiqube",version:"1.0",uid_admin:"jchen",etat_id:e1.id)

ep1=EtapeApp.create(nom:"Brouillion")
ep2=EtapeApp.create(nom:"cours de validation")
ep3=EtapeApp.create(nom:"Validé")
ep4=EtapeApp.create(nom:"Refusé")
ep5=EtapeApp.create(nom:"Archivé")

g1=GroupeUser.create(nom:"DTIC")
gp1=GroupeApp.create(nom:"EDTIC")

App.create(nom:"lifray", niveau:"font", etat_app_id:e1.id, etape_app_id:ep1.id, groupe_app_id: gp1.id,description:"description de lifray")
App.create(nom:"SSH", niveau:"mid", etat_app_id:e3.id, etape_app_id:ep2.id, groupe_app_id: gp1.id,description:"description de ssh")

r1=Role.create(nom: "User")
r2=Role.create(nom: "Admin")
r3=Role.create(nom: "RF")
r4=Role.create(nom: "RT")

UserAppRole.create(user_id:2,app_id:1,role_id:1)
UserAppRole.create(user_id:2,app_id:2,role_id:3)
UserAppRole.create(user_id:1,app_id:1,role_id:2)
UserAppRole.create(user_id:1,app_id:2,role_id:4)
