import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Int "mo:base/Int";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {

  stable var startTime = Time.now();

  stable var currentValue : Float = 300;
  currentValue := 200;
  let id = 3456753234567;

  public func topUp(amount : Float) {
    currentValue += amount;

    Debug.print(debug_show (currentValue));
  };

  public func withdraw(amount : Float) {
    let tempValue : Float = currentValue - amount;
    if (tempValue >= 0) {
      currentValue -= amount;
      Debug.print("your ballance is " # debug_show (currentValue));
    } else {
      Debug.print("You doesn't have enough value to withdraw. Your current value is" # debug_show (currentValue));
    };
  };

  public query func showVal() : async Float {
    return currentValue;
  };

  public func compound() {
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedS = timeElapsedNS / 1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
    startTime := currentTime;
  };

};
