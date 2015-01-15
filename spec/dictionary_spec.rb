require('dictionary')
require('rspec')

describe(Term) do
  before() do
    Term.clear()
  end

  describe('#word') do
    it("returns the word that we have defined") do
      test_entry = Term.new("van", "large car for camping")
      expect(test_entry.word()).to(eq("van"))
    end
  end
  describe('#definition') do
    it("returns the definition that we have given") do
      test_entry = Term.new("van", "large car for camping")
      expect(test_entry.definition()).to(eq("large car for camping"))
    end
  end

  describe("#save") do
    it("adds an entry to the master list") do
      test_entry1 = Term.new("van", "large car for camping")
      test_entry2 = Term.new("car", "small van for driving")
      test_entry1.save()
      test_entry2.save()
      expect(Term.all()).to(eq([test_entry1, test_entry2]))
    end
  end

  describe('.redefine') do
    it("will edit the definition") do
    test_entry1 = Term.new("van", "large car for camping")
    test_entry1.save()
    Term.search("van").redefine("vehicle drive with big")
    expect(test_entry1.definition()).to(eq("vehicle drive with big"))
    end
  end

  describe('.search') do
    it("returns the entire entry for a searched term") do
    test_entry1 = Term.new("van", "large car for camping")
    test_entry2 = Term.new("car", "small vehicle for driving")
    test_entry1.save()
    test_entry2.save()
    expect(Term.search("van")).to(eq(test_entry1))
    end
  end

  describe('#append') do
    it("adds a second or third, etc. definition to single headword") do
      test_entry1 = Term.new("van", "large car for camping")
      test_entry1.append("small vehicle for driving")
      expect(test_entry1.definition()).to(eq("large car for camping; small vehicle for driving"))
    end
  end

  describe('#woppend') do
    it("adds a second or third, etc headword to an entry") do
      test_entry1 = Term.new("van", "large car for camping")
      test_entry1.woppend("Auto")
      expect(test_entry1.word()).to(eq("van; Auto"))
    end
  end
end
