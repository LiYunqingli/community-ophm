import { preferences } from "@kit.ArkData";
import { common } from "@kit.AbilityKit";

export async function setToken(context:common.UIAbilityContext,token:string){
  const a = await preferences.getPreferences(context,'auto')
  await a.put('token',token)
  await a.flush()
}

export async function getToken(context:common.UIAbilityContext){
  const a = await preferences.getPreferences(context, 'auto');
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