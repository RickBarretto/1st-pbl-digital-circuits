# Display

The display has the function of showing information about the system to the final user.
For this, it's used a 7-segment display to show this.

## The internal working

The displays works with reverse logic, then the logic is about disable the segments,
instead of enable it.

The choosen approach was to map each segment and see what inputs and conditions they need to,
to be disabled.

So, first, let's map which segments we need for which case:

### First Step

Define wich segments must be disabled for each case:

#### When on Irrigation mode:

Splinker (Aspersor): Letter A

```
┏━━━━┓
┃    ┃
┣━━━━┫
┃    ┃
┗    ┛
```

Disables: bottom


Dripper (Gotejador): Letter G

```
┏━━━━┓
┃    
┃    ┓
┃    ┃
┗━━━━┛
```

Disables: top-right

#### When on Water Level mode:

Critical (Crítico): Letter C

```
┏━━━━┓
┃    ┃
┃    ┃
┃    ┃ 
┗━━━━┛
```

Disables: top-right and bottom-right

Low (Baixo): Number 1

```
     ┓
     ┃
     ┫
     ┃
     ┛
```

Disables: top, top-left, bottom-left, middle and bottom

Middle (Médio): Number 2

```
┏━━━━┓
     ┃
┏━━━━┛
┃    
┗━━━━┛
```

Disables: top-left and bottom-right

High (Alto): Number 3

```
┏━━━━┓
     ┃
 ━━━━┫
     ┃
┗━━━━┛
```

Disables: top-left and bottom-left

#### Any Mode

Conflicting Inputs (Entradas Conflitantes): Letter E

```
┏━━━━┓
┃    
┣━━━━
┃     
┗━━━━┛
```

### Second Step

See the conditions for each segment:

* Top Segment:
    1. Water Level Mode and Low Water Level
* Top-left Segment:
    1. Conflicting Inputs
    2. Water Level Mode and Low Water Level
    3. Water Level Mode and Mid Water Level
    4. Water Level Mode and High Water Level
* Top-right Segment:
    * Irrigation Mode and Dripper
* Middle Segment:
    * Irrigation Mode and Dripper
    * Water Level Mode and Critical Water Level
    * Water Level Mode and Low Water Level
* Bottom-left Segment:
    * Water Level Mode and Low Water Level
    * Water Level Mode and High Water Level
* Bottom-right Segment:
    * Conflicting Inputs
    * Water Level Mode and Mid Water Level
* Bottom Segment:
    * Irrigation Mode and Splinker
    * Water Level Mode and Low Water Level

> [!NOTE]
> * On **Top-lfet**: Case 02 covers the case 03 and 04, since high and middle needs low to be enabled too
> * Bottom-left can be seen as `low_water_level and not mid_water_level`.
> * Top-right and Middle shares conditions in common, `irrigation_mode_on and dripper`
> * Middle for water level can be seen as `not mid_water_level`, so this will never be on middle or high level.
