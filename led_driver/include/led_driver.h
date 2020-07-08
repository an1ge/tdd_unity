#ifndef __LED_DRIVER_H
#define __LED_DRIVER_H

#include <stdint.h>
#include <stdbool.h>

void LedDriver_Create (uint16_t *address);

void LedDriver_TurnOn (uint16_t);
void LedDriver_TurnOff (uint16_t);
void LedDriver_TurnAllOn (void);
bool LedDriver_IsOn (uint16_t);
bool LedDriver_IsOff (uint16_t);
void LedDriver_TurnAllOff (void);











#endif
