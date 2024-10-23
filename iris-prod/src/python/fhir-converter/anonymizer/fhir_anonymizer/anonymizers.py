import hashlib
from datetime import datetime, timedelta
from time import strptime


def hash_string():
    return lambda x,y,z: hashlib.sha256(x.encode()).hexdigest()

def mask(value = "REDACTED"):
    return value

def peusdo():
    return lambda x,y,z: "PEUSDO"

def shift_time(offset_day=90):
    def _shift_time(date_str):
        date_obj = strptime(date_str, "%Y-%m-%d")
        # shift the date by the offset
        new_date_obj = datetime(date_obj.tm_year, date_obj.tm_mon, date_obj.tm_mday) + timedelta(days=offset_day)
        # return the new date in the same format as the input
        return new_date_obj.strftime("%Y-%m-%d")

    return lambda x,y,z: _shift_time(x)

def birth_date_shift():
    # move the birthdate to the last year 12/31
    # e.g. 1980-02-12 -> 1979-12-31
    return lambda x,y,z: f"{str(int(x[:4])-1)}-12-31"
