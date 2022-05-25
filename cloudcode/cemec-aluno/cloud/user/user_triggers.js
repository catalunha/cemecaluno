
Parse.Cloud.beforeSave(Parse.User,async(req)=>{
  let user = req.object;
  console.log(`beforeSave user ${user.id}. Create profile`);
  console.log(`beforeSave profile is  ${user.get('profile')}`);

  if(user.get('profile')===undefined){
    const profile = new Parse.Object("Profile");
    let profileResult = await profile.save(null,{ useMasterKey: true });
    user.set('profile',profileResult);
  }
});

Parse.Cloud.afterSave(Parse.User,async(req)=>{
  let user = req.object;
  console.log(`afterSave user ${user.id}. Set ACL profile`);
  const profile = new Parse.Object("Profile");
  profile.id= user.get('profile').id;
  const profileACL = new Parse.ACL(user);
  profileACL.setPublicReadAccess(false);
  profileACL.setPublicWriteAccess(false);
  // profileACL.setReadAccess(user,true);
  // profileACL.setWriteAccess(user,true);
  profile.setACL(profileACL)
  let profileResult = await profile.save(null,{ useMasterKey: true });

  let userCurrent = req.object;
  userCurrent.set('profile',profileResult);
});

Parse.Cloud.afterDelete(Parse.User,async(req)=>{
  let user = req.object;

  console.log(`afterDelete user ${user.id}`);
  const profile = new Parse.Object("Profile");
  console.log(`delete profile ${user.get('profile').id}`);

  profile.id = user.get('profile').id;
  await profile.destroy({ useMasterKey: true });
});
