from .anonymizers import mask, hash_string, shift_time, peusdo , birth_date_shift

names = {
    '$.name[*].family': mask(),
    '$.name[*].given[*]': mask(),
}

address = {
    '$.address[*].line[*]':  mask(),
    '$.address[*].city':  mask(),
    '$.address[*].postalCode' : mask("9970000"),
}

identifiers = {
    '$.identifier[*].value': hash_string()
}

dates = {
    '$.birthDate': birth_date_shift()
}

contact = {
    '$.telecom[*].value': mask()
}

rules = [
    dates,
    names,
    address,
    identifiers
]