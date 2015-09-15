# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
e1=EtatApp.create(nom:"Normal")
e2=EtatApp.create(nom:"En panne")
e3=EtatApp.create(nom:"Maintenance")

Application.create(nom:"Ubiqube",version:"1.0",uid_admin:"jchen",uid_dsi:"jchen",etat_id:e1.id)

ep1=EtapeApp.create(nom:"Brouillion")
ep2=EtapeApp.create(nom:"cours de validation")
ep3=EtapeApp.create(nom:"Validé")
ep4=EtapeApp.create(nom:"Refusé")
ep5=EtapeApp.create(nom:"Archivé")

g1=GroupeUser.create(nom:"DTIC")

UserGroupeUser.create(groupe_user_id:g1.id, user_id:1)
UserGroupeUser.create(groupe_user_id:g1.id, user_id:2)

a1=App.create(nom:"lifray", niveau:"font", etat_app_id:e1.id, etape_app_id:ep1.id,description:"description de lifray")
a2=App.create(nom:"SSH", niveau:"mid", etat_app_id:e2.id, etape_app_id:ep2.id,description:"description de ssh")
a3=App.create(nom:"HTTP", niveau:"mid", etat_app_id:e1.id, etape_app_id:ep3.id,description:"description de HTTP")
GroupeApp.create(groupe_user_id: g1.id, app_id:a1.id)
GroupeApp.create(groupe_user_id: g1.id, app_id:a2.id)
GroupeApp.create(groupe_user_id: g1.id, app_id:a3.id)

r1=Role.create(nom: "User")
r2=Role.create(nom: "Admin")
r3=Role.create(nom: "RF")
r4=Role.create(nom: "RT")
r4=Role.create(nom: "DSI")

UserAppRole.create(user_id:2, app_id:1, role_id:1)
UserAppRole.create(user_id:2, app_id:2, role_id:3)
UserAppRole.create(user_id:1, app_id:2, role_id:3)
UserAppRole.create(user_id:1, app_id:3, role_id:4)
UserAppRole.create(user_id:1, app_id:1, role_id:1)
ip1=Ip.create(ip_addr:167969652)#ip:10.3.3.116
ip2=Ip.create(ip_addr:180552305)#ip:10.195.2.113

vm1=Vm.create(nom:"Preprod", ip_default:180552305, template:"Windows7", etat_app_id:e1.id)
vm2=Vm.create(nom:"Prod", ip_default:180552305, template:"Sabayon", etat_app_id:e1.id)

s1=Service.create(nom:"SSH", port_default:22, protocole:"TCP", install_default:true)

sIN1=ServiceInApp.create(app_id:2, service_id:s1.id, port:s1.port_default)
VmInstallServiceIn.create(service_in_app_id:sIN1.id, vm_id:vm1.id)
