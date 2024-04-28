# Display

The display has the function of showing information about the system to the final user.
For this, it's used a 7-segment display to show this.

## The internal working

The displays works with reverse logic, then the logic is about disable the segments,
instead of enable it.
The choosen approach was to map each segment and see what inputs and conditions they need to,
to be disabled. 
So, let's map which segments we need for which case:

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
