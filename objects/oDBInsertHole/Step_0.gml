//Change Light Scale
lightTime += lightSpd;
lightScaleX = .9 + sin(lightTime) * lightAmount;
lightScaleY = .95 + sin(lightTime) * (lightAmount * 0.3);