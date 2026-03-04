import { preferences } from "@kit.ArkData";
import { common } from "@kit.AbilityKit";
import { router } from "@kit.ArkUI";

export async function setToken(context:common.UIAbilityContext,token:string){
  const a = await preferences.getPreferences(context,'auth')
  await a.put('token',token)
  await a.flush()
}

export async function getToken(context:common.UIAbilityContext){
  const a = await preferences.getPreferences(context, 'auth');
  let token = await a.get('token', '') as string;
  return token;
}

export async function checkToken(context:common.UIAbilityContext){
  if (await getToken(context)) {
    return true;
  }else {
    return false;
  }
}

export async function removeToken(context:common.UIAbilityContext): Promise<boolean>{
  const a = await preferences.getPreferences(context, 'auth')
  await a.delete('token')
  await a.flush()
  loginPage();
  return checkToken(context);
}

export function loginPage(){
  router.replace({
    url:"pages/Login"
  })
}