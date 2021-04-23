//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.6.8;

import './interfaces/IERC721.sol';
import './libraries/SafeMath.sol';
import "./ownership/Ownable.sol";
import "./lifecycle/Pausable.sol";

contract ERC721 is IERC721, Ownable, Pausable {

    using SafeMath for uint;

    string internal _name;
    string internal _symbol;

    mapping (address => uint256) internal _balances;
    mapping (address => mapping (address => uint256)) internal _allowed;

    event Transfer(address indexed _from, address indexed _to, uint256 indexed _tokenId);
    event Approval(address indexed _owner, address indexed _approved, uint256 indexed _tokenId);
    //event ApprovalForAll(address indexed _owner, address indexed _operator, bool _approved);
    //event Mint(address indexed minter, address indexed account, uint256 amount);
    //event Burn(address indexed burner, address indexed account, uint256 amount);

    constructor (
        string memory name, 
        string memory symbol, 
    ) public
    {
        _symbol = symbol;
        _name = name;
    }

    function name(
    ) public view returns (string memory)
    {
        return _name;
    }

    function symbol(
    ) public view returns (string memory)
    {
        return _symbol;
    }

    function transfer(
        address _to, 
        uint256 _tokenId
    ) public override
        whenNotPaused 
      returns (bool)
    {
        require(_to != address(0), 'ERC721: to address is not valid');
        require(_value <= _balances[msg.sender], 'ERC721: insufficient balance');
        
        _balances[msg.sender] = SafeMath.sub(_balances[msg.sender], _value);
        _balances[_to] = SafeMath.add(_balances[_to], _value);
        
        emit Transfer(msg.sender, _to, _value);
        
        return true;
    }

   function balanceOf(
       address _owner
    ) public override view returns (uint256 balance) 
    {
        return _balances[_owner];
    }

    function ownerOf(uint256 _tokenId) external view returns (address);
    
    function safeTransferFrom(address _from, address _to, uint256 _tokenId, bytes data) external payable;
    
    function safeTransferFrom(address _from, address _to, uint256 _tokenId) external payable;

   function transferFrom(
        address _from, 
        address _to, 
        uint256 _tokenId
    ) public override
        whenNotPaused
      returns (bool) 
    {
        require(_from != address(0), 'ERC721: from address is not valid');
        require(_to != address(0), 'ERC721: to address is not valid');
        require(_tokenId <= _balances[_from], 'ERC721: insufficient balance');
        require(_tokenId <= _allowed[_from][msg.sender], 'ERC721: from not allowed');

        _balances[_from] = SafeMath.sub(_balances[_from], _tokenId);
        _balances[_to] = SafeMath.add(_balances[_to], _tokenId);
        _allowed[_from][msg.sender] = SafeMath.sub(_allowed[_from][msg.sender], _tokenId);
        
        emit Transfer(_from, _to, _tokenId);
        
        return true;
   }

    function approve(
       address _approved, 
       uint256 _tokenId
    ) public override
        whenNotPaused
      returns (bool) 
    {
        _allowed[msg.sender][_approved] = _tokenId;
        
        emit Approval(msg.sender, _approved, _tokenId);
        
        return true;
   }

    //function setApprovalForAll(address _operator, bool _approved) external;


    //function getApproved(uint256 _tokenId) external view returns (address);

 
    //function isApprovedForAll(address _owner, address _operator) external view returns (bool);

    /*

    function allowance(
        address _owner, 
        address _approved
    ) public override view 
        whenNotPaused
      returns (uint256) 
    {
        return _allowed[_owner][_approved];
    }

    function increaseApproval(
        address _approved, 
        uint _addedValue
    ) public
        whenNotPaused
      returns (bool)
    {
        _allowed[msg.sender][_approved] = SafeMath.add(_allowed[msg.sender][_approved], _addedValue);
        
        emit Approval(msg.sender, _approved, _allowed[msg.sender][_approved]);
        
        return true;
    }

    function decreaseApproval(
        address _approved, 
        uint _subtractedValue
    ) public
        whenNotPaused
      returns (bool) 
    {
        uint oldValue = _allowed[msg.sender][_approved];
        
        if (_subtractedValue > oldValue) {
            _allowed[msg.sender][_approved] = 0;
        } else {
            _allowed[msg.sender][_approved] = SafeMath.sub(oldValue, _subtractedValue);
        }
        
        emit Approval(msg.sender, _approved, _allowed[msg.sender][_approved]);
        
        return true;
   }

    function mintTo(
        address _to,
        uint _amount
    ) public
        whenNotPaused
        onlyOwner
    {
        require(_to != address(0), 'ERC721: to address is not valid');
        require(_amount > 0, 'ERC721: amount is not valid');

        _totalSupply = _totalSupply.add(_amount);
        _balances[_to] = _balances[_to].add(_amount);

        emit Mint(msg.sender, _to, _amount);
    }

    function burnFrom(
        address _from,
        uint _amount
    ) public
        whenNotPaused
        onlyOwner
    {
        require(_from != address(0), 'ERC721: from address is not valid');
        require(_balances[_from] >= _amount, 'ERC721: insufficient balance');
        
        _balances[_from] = _balances[_from].sub(_amount);
        _totalSupply = _totalSupply.sub(_amount);

        emit Burn(msg.sender, _from, _amount);
    }

    */

}