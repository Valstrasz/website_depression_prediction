from enum import StrEnum



class TypeGender (StrEnum):
    FEMALE = "Female"
    MALE = "Male"
    OTHER = "Other"


class TypeProfession (StrEnum):
    ARCHITECT = "Architect"
    CHEF = "Chef"
    CIVIL_ENGINEER = "Civil Engineer"
    CONTENT_WRITER = "Content Writer"
    DIGITAL_MARKETER = "Digital Marketer"
    DOCTOR = "Doctor"
    EDUCATIONAL_CONSULTANT = "Educational Consultant"
    ENTREPRENEUR = "Entrepreneur"
    LAWYER = "Lawyer"
    MANAGER = "Manager"
    PHARMACIST = "Pharmacist"
    STUDENT = "Student"
    TEACHER = "Teacher"
    UX_UI_DESIGNER = "UX/UI Designer"


class TypeSleepDuration (StrEnum):
    H_LESS_5 = "Less than 5 hours"
    H_5_6 = "5-6 hours"
    H_7_8 = "7-8 hours"
    H_MORE_8 = "More than 8 hours"
    OTHERS = "Others"


class TypeDietaryHabits (StrEnum):
    HEALTHY = "Healthy"
    MODERATE = "Moderate"
    UNHEALTHY = "Unhealthy"
    OTHERS = "Others"


class TypeDegree (StrEnum):
    B_ARCH = "B.Arch"
    B_COM = "B.Com"
    B_ED = "B.Ed"
    B_PHARM = "B.Pharm"
    B_TECH = "B.Tech"
    BA = "BA"
    BBA = "BBA"
    BCA = "BCA"
    BE = "BE"
    BHM = "BHM"
    BSC = "BSc"
    CLASS_12 = "Class 12"
    LLB = "LLB"
    LLM = "LLM"
    M_COM = "M.Com"
    M_ED = "M.Ed"
    M_PHARM = "M.Pharm"
    M_TECH = "M.Tech"
    MA = "MA"
    MBA = "MBA"
    MBBS = "MBBS"
    MCA = "MCA"
    MD = "MD"
    ME = "ME"
    MHM = "MHM"
    MSC = "MSc"
    OTHERS = "Others"
    PHD = "PhD"