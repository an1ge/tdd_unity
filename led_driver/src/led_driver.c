#include "led_driver.h"
#include "runtime_error.h"

#include <stdbool.h>

enum {ALL_LEDS_ON = ~0, ALL_LEDS_OFF = ~ALL_LEDS_ON};
enum {FIRST_LED = 0, LAST_LED = 16};

static uint16_t *ledsAddress;
static uint16_t ledsImage;

void LedDriver_Create (uint16_t * address)
{
    ledsAddress = address;
    ledsImage = ALL_LEDS_OFF;
    *ledsAddress = ledsImage;
}

static bool isLedOutOfBounds(uint16_t number)
{
    if ((number <= FIRST_LED) || (number > LAST_LED))
    {
        RUNTIME_ERROR("LED Driver: out-of-bounds LED", -1);
        return true;
    }

    return false;
}

static uint16_t convertLedNumberToBit (uint16_t number)
{
    return (1 << (number - 1));
}

static void updateHardware (void)
{
    *ledsAddress = ledsImage;
}

static void setLedImageBit (uint16_t number)
{
    ledsImage |= convertLedNumberToBit(number);
}

void LedDriver_TurnOn (uint16_t number)
{
    if (isLedOutOfBounds(number))
        return;

    setLedImageBit(number);
    updateHardware();
}

static void clearLedImageBit (uint16_t number)
{
    ledsImage &= ~convertLedNumberToBit(number);
}

void LedDriver_TurnOff (uint16_t number)
{    
    if (isLedOutOfBounds(number))
        return;

    clearLedImageBit(number);
    updateHardware();
}

void LedDriver_TurnAllOn (void)
{
    ledsImage = ALL_LEDS_ON;
    updateHardware();
}

void LedDriver_TurnAllOff (void)
{
    ledsImage = ALL_LEDS_OFF;
    updateHardware();
}

bool LedDriver_IsOn (uint16_t number)
{
    if (isLedOutOfBounds(number))
        return false;
    
    return ledsImage & (convertLedNumberToBit(number));
}

bool LedDriver_IsOff (uint16_t number)
{    
    return !LedDriver_IsOn(number);
}

void LedDriver_Destroy (void)
{
}