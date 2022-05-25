const component = new Parse.Object('Component');
component.id='KVDOBqYwDD';//para update
// component.set("module","Modulo 1 - Auriculo");	
// component.set("subject","Aula 1 - Auriculo");	
// component.addRelation('teachers',Parse.Object('Profile').id = '7q5gA9KDoy');
component.relation("teachers").add(Parse.Object('Profile').id = '7q5gA9KDoy');
// component.set("folder","https://drive.google.com/drive/folders/1XSJRKkFXyAG6hkwAK4dXUts9NNCJP3-7?usp=sharing");	
// component.set("video","https://youtu.be/J4BVaXkwmM8");
component.save(null,{useMasterKey:true});

const profile = new Parse.Object('Profile'); profile.id = 'https://discord.com/'; component.set('organizer').add(profile);