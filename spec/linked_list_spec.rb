require "spec_helper"

describe LinkedList::Node do
  describe "init" do
    let(:node2) { described_class.new(2) }
    let(:node) { described_class.new(1, node2) }

    it "assigns data" do
      expect(node.data).to eq 1
    end

    it "assigns forward" do
      expect(node.forward).to eq node2
    end

  end

  describe "#to_s" do
    context "when single node exit" do
      it "returns string with data" do
        node = described_class.new 1
        expect(node.to_s).to eq "Data: 1 "
      end
    end

    context "when next node exist" do
      it "returns string with forward data when exist" do
        node = described_class.new(1, described_class.new(2))
        expect(node.to_s).to eq "Data: 1 Points to: 2"
      end
    end
  end
end

describe LinkedList::DoublyNode do
  let(:node1) { described_class.new(1) }
  let(:node3) { described_class.new(3) }
  let(:node) { described_class.new(2, node1, node3) }

  describe "init" do
    it "assigns node data" do
      expect(node.data).to eq 2
    end

    it "assigns node forward" do
      expect(node.backward).to eq node1
    end

    it "assigns node backward" do
      expect(node.forward).to eq node3
    end
  end

  describe "#to_s" do
    context "when single node" do
      it "returns a string with data" do
        node = described_class.new "single node"
        expect(node.to_s).to eq "Data: single node "
      end
    end

    context "when backward nodes exist" do
      it "returns a string with forward data when exist" do
        node = described_class.new(2, node1)
        expect(node.to_s).to eq "Data: 2  Pointed by: 1"
      end
    end

    context "when backward & forward nodes exist" do
      it "returns a string with all pointer reference" do
        expect(node.to_s).to eq "Data: 2 Points to: 3 Pointed by: 1"
      end
    end
  end
end

describe LinkedList::Singly do
  describe "init" do
    context "when single node" do
      it do
        singly = described_class.new(1)
        expect(singly.head.data).to eq 1
      end
    end

    context "when multiple nodes" do
      it do
        arr = [1, 2, 3]
        singly = described_class.new(arr)
        expect(singly.head.data).to eq 1
      end
    end
  end

  let(:singly) { described_class.new([1, 2, 3])}

  describe "#head" do
    it "returns instance of LinkedList::Node" do
      expect(singly.head).to be_instance_of LinkedList::Node
    end

    it "returns data" do
      expect(singly.head.data).to eq 1
    end
  end

  describe "#parse" do
    specify { expect { singly.parse }.to output("1\n2\n3\n").to_stdout }
  end

  describe "#find" do
    it do
      node = singly.find(1)
      expect(node.data).to eq 1
      expect(node.forward.data).to eq 2
    end

    it do
      node = singly.find(2)
      expect(node.data).to eq 2
      expect(node.forward.data).to eq 3
    end

    it do
      node = singly.find(3)
      expect(node.data).to eq 3
      expect(node.forward).to be nil
    end
  end

  describe "#no_of_nodes" do
    it do
      expect(singly.no_of_nodes).to eq 3
    end
  end

  describe "#add" do
    it "add no_of_nodes by 1" do
      expect{ singly.add(4) }.to change { singly.no_of_nodes }.by(1)
    end
  end

  describe "#add_a" do
    it "accepts array and add no_of_nodes by 3" do
      expect{ singly.add_a([4, 5, 6]) }.to change { singly.no_of_nodes }.by(3)
    end
  end

  describe "#edit" do
    it do
      expect(singly.find(3).data).to_not be_nil
      singly.edit(3, 9)
      expect(singly.find(3)).to be_nil
      expect(singly.find(9).data).to eq 9
    end
  end

  describe "#to_a" do
    it "returns array" do
      expect(singly.to_a).to eq([1, 2, 3])
    end
  end

  describe "#to_s" do
    it do
      expect(singly.to_s).to eq [1, 2, 3].join(", ")
    end
  end

  describe "#delete" do
    it "remove single node" do
      expect { singly.delete(1) }.to change { singly.no_of_nodes }.by(-1)
    end

    it "remove any node that match data" do
      expect(singly.find(2)).to_not be_nil
      singly.delete(2)
      expect(singly.find(2)).to be_nil
    end
  end
end

describe LinkedList::Doubly do
  describe "init" do
    context "when single node" do
      it do
        singly = described_class.new(1)
        expect(singly.head.data).to eq 1
      end
    end

    context "when multiple nodes" do
      it do
        arr = [1, 2, 3]
        singly = described_class.new(arr)
        expect(singly.head.data).to eq 1
        expect(singly.head.forward.data).to eq 2
      end
    end
  end

  let(:doubly) { described_class.new([1, 2 ,3]) }

  describe "#add" do
    it "adds no of nodes" do
      expect(doubly.no_of_nodes).to eq 3
      expect { doubly.add(4) }.to change { doubly.no_of_nodes }.by(1)
      expect(doubly.no_of_nodes).to eq 4
    end
  end

  describe "#delete" do
    it "removes a node" do
      expect(doubly.find(2)).to_not be_nil
      doubly.delete(2)
      expect(doubly.find(2)).to be_nil
    end
  end
end
