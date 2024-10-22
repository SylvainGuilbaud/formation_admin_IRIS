from sqlalchemy import Column, String, Integer, UniqueConstraint
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()

class AnonymizedIdentifiable(Base):
    __tablename__ = 'anonymized_identifiable'

    # id primary key with autoincrement
    id = Column(Integer, primary_key=True)
    # resource_type with a maximum length of 255 characters
    resource_type = Column(String(255))
    # resource_id with a maximum length of 255 characters
    resource_id = Column(String(255))
    # resource_id_anonymized with a maximum length of 255 characters
    resource_id_anonymized = Column(String(255))
    # create a unique constraint on resource_type and resource_id
    __table_args__ = (UniqueConstraint('resource_type', 'resource_id'),)

