# Berechnung der Laufzeit eines Annuitätendarlehens mit monatlicher Zahlung

def darlehenslaufzeit_monatlich(kredit, jahreszins, rate):
    monatlicher_zins = jahreszins / 12
    rest = kredit
    monate = 0

    while rest > 0:
        zinsen = rest * monatlicher_zins
        tilgung = rate - zinsen

        # Wenn die Rate zu gering ist
        if tilgung <= 0:
            print("Die monatliche Rate ist zu gering — der Kredit wird niemals getilgt!")
            return None

        rest -= tilgung
        monate += 1

    return monate


# Eingabe
kredit = float(input("Darlehensbetrag (€): "))
jahreszins = float(input("Zinssatz pro Jahr (%): ")) / 100
rate = float(input("Monatliche Rate (€): "))

monate = darlehenslaufzeit_monatlich(kredit, jahreszins, rate)

if monate:
    jahre = monate // 12
    restmonate = monate % 12
    print(f"\nDer Kredit ist nach {monate} Monaten abbezahlt.")
    print(f"Das sind ca. {jahre} Jahre und {restmonate} Monate.")