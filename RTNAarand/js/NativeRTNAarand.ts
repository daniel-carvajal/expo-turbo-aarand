import { TurboModule, TurboModuleRegistry } from "react-native";

export interface Spec extends TurboModule {
  add(a: number, b: number): Promise<number>;
  performAarandLogic(): Promise<string>;
}

export default TurboModuleRegistry.get<Spec>("RTNAarand") as Spec | null;