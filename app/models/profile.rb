class Profile < ApplicationRecord

	belongs_to :user
  has_many :images
	has_many :goals
  has_many :profile_sports
  has_many :sports, through: :profile_sports

	# reverse_geocoded_by :latitude, :longitude
	# after_validation :reverse_geocode  # auto-fetch address

  GENDER = %w(Male Female Transgender)
	FLEVEL = %w(Beginner Intermediate Expert)
	COUNTY = [
	"Avon",
	"Bedfordshire",
	"Berkshire",
	"Borders",
	"Buckinghamshire",
	"Cambridgeshire",
	"Central",
	"Cheshire",
	"Cleveland",
	"Clwyd",
	"Cornwall",
	"County Antrim",
	"County Armagh",
	"County Down",
	"County Fermanagh",
	"County Londonderry",
	"County Tyrone",
	"Cumbria",
	"Derbyshire",
	"Devon",
	"Dorset",
	"Dumfries and Galloway",
	"Durham",
	"Dyfed",
	"East Sussex",
	"Essex",
	"Fife",
	"Gloucestershire",
	"Grampian",
	"Greater Manchester",
	"Gwent",
	"Gwynedd County",
	"Hampshire",
	"Herefordshire",
	"Hertfordshire",
	"Highlands and Islands",
	"Humberside",
	"Isle of Wight",
	"Kent",
	"Lancashire",
	"Leicestershire",
	"Lincolnshire",
	"Lothian",
	"Merseyside",
	"Mid Glamorgan",
	"Norfolk",
	"North Yorkshire",
	"Northamptonshire",
	"Northumberland",
	"Nottinghamshire",
	"Oxfordshire",
	"Powys",
	"Rutland",
	"Shropshire",
	"Somerset",
	"South Glamorgan",
	"South Yorkshire",
	"Staffordshire",
	"Strathclyde",
	"Suffolk",
	"Surrey",
	"Tayside",
	"Tyne and Wear",
	"Warwickshire",
	"West Glamorgan",
	"West Midlands",
	"West Sussex",
	"West Yorkshire",
	"Wiltshire",
	"Worcestershire",
]


end
