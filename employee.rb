class Employee
  def initialize(name:, email:, phone:, salary:)
    @name = name
    @email = email
    @phone = phone
    @salary = salary
    @review = review
    @score = 0
  end

  def name
    @name
  end

  def email
    @email
  end

  def phone
    @phone
  end

  def salary
    @salary
  end

  def add_review_text(a)
    @review = a
  end

  def review
    @review
  end

  def add_review_score(a)
    @score = a
  end

  def score
    @score
  end

  def ind_raise(a)
    @salary = @salary + a
  end
end
